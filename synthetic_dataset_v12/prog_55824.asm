; DESCRIPTION: Renders a cyan box of size 17x59 starting at (269, 91).
; PLAN: r0=269(x), r1=91(y), r2=17(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 91
LDI r2, 17
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
