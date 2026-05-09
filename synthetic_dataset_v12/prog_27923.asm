; DESCRIPTION: Renders a green box of size 98x91 starting at (316, 103).
; PLAN: r0=316(x), r1=103(y), r2=98(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 103
LDI r2, 98
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
