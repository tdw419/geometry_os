; DESCRIPTION: Renders a yellow box of size 54x30 starting at (228, 37).
; PLAN: r0=228(x), r1=37(y), r2=54(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 37
LDI r2, 54
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
