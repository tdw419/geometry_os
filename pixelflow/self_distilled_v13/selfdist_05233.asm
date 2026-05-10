; DESCRIPTION: Renders a cyan rectangular region spanning 67 by 107 at (127, 200).
; PLAN: r0=127(x), r1=200(y), r2=67(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 200
LDI r2, 67
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
