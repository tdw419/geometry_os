; DESCRIPTION: Renders a cyan box of size 108x52 starting at (32, 109).
; PLAN: r0=32(x), r1=109(y), r2=108(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 109
LDI r2, 108
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
