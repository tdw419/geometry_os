; DESCRIPTION: Renders a cyan box of size 90x61 starting at (162, 144).
; PLAN: r0=162(x), r1=144(y), r2=90(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 144
LDI r2, 90
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
