; DESCRIPTION: Creates a cyan rectangular region at (449, 146) spanning 38 by 74 pixels.
; PLAN: r0=449(x), r1=146(y), r2=38(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 146
LDI r2, 38
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
