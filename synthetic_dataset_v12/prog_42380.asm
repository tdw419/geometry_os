; DESCRIPTION: Creates a red rectangular region at (327, 51) spanning 39 by 86 pixels.
; PLAN: r0=327(x), r1=51(y), r2=39(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 51
LDI r2, 39
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
