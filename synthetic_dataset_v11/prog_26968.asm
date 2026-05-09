; DESCRIPTION: Renders a cyan box of size 52x91 starting at (198, 1).
; PLAN: r0=198(x), r1=1(y), r2=52(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 1
LDI r2, 52
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
