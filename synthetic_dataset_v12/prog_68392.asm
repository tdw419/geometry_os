; DESCRIPTION: Renders a white box of size 98x111 starting at (290, 101).
; PLAN: r0=290(x), r1=101(y), r2=98(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 101
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
