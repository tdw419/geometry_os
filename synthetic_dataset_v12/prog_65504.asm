; DESCRIPTION: Creates a cyan rectangular region at (153, 177) spanning 98 by 48 pixels.
; PLAN: r0=153(x), r1=177(y), r2=98(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 177
LDI r2, 98
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
