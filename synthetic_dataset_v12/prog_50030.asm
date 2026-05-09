; DESCRIPTION: Renders a cyan box of size 94x59 starting at (260, 22).
; PLAN: r0=260(x), r1=22(y), r2=94(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 22
LDI r2, 94
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
