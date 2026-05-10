; DESCRIPTION: Renders a cyan rectangular region spanning 74 by 68 at (213, 160).
; PLAN: r0=213(x), r1=160(y), r2=74(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 160
LDI r2, 74
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
