; DESCRIPTION: Renders a cyan rectangular region spanning 47 by 14 at (158, 186).
; PLAN: r0=158(x), r1=186(y), r2=47(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 186
LDI r2, 47
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
