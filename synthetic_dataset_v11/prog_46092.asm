; DESCRIPTION: Composite: . Then Draws a black line from (22, 253) to (168, 39). Then Renders a green box of size 28x64 starting at (69, 56).
; PLAN: r0=22(x1), r1=253(y1), r2=168(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=56(y), r2=28(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (22, 253) to (168, 39).
; PLAN: r0=22(x1), r1=253(y1), r2=168(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 253
LDI r2, 168
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 28x64 starting at (69, 56).
; PLAN: r0=69(x), r1=56(y), r2=28(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 56
LDI r2, 28
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
