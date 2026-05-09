; DESCRIPTION: Creates a cyan rectangular region at (242, 81) spanning 102 by 25 pixels.
; PLAN: r0=242(x), r1=81(y), r2=102(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 81
LDI r2, 102
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
