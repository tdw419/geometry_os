; DESCRIPTION: Creates a white rectangular region at (393, 93) spanning 57 by 54 pixels.
; PLAN: r0=393(x), r1=93(y), r2=57(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 93
LDI r2, 57
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
