; DESCRIPTION: Renders a cyan rectangular region spanning 106 by 114 at (271, 146).
; PLAN: r0=271(x), r1=146(y), r2=106(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 146
LDI r2, 106
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
