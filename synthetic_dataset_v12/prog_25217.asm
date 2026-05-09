; DESCRIPTION: Renders a yellow box of size 22x22 starting at (489, 228).
; PLAN: r0=489(x), r1=228(y), r2=22(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 228
LDI r2, 22
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
