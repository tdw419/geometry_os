; DESCRIPTION: Renders a cyan box of size 120x114 starting at (46, 136).
; PLAN: r0=46(x), r1=136(y), r2=120(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 136
LDI r2, 120
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
