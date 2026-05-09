; DESCRIPTION: Renders a green box of size 113x18 starting at (207, 154).
; PLAN: r0=207(x), r1=154(y), r2=113(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 154
LDI r2, 113
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
