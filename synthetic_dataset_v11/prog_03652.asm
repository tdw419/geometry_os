; DESCRIPTION: Creates a white rectangular region at (51, 197) spanning 96 by 42 pixels.
; PLAN: r0=51(x), r1=197(y), r2=96(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 197
LDI r2, 96
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
