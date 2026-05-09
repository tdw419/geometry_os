; DESCRIPTION: Renders a cyan box of size 91x100 starting at (50, 19).
; PLAN: r0=50(x), r1=19(y), r2=91(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 19
LDI r2, 91
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
