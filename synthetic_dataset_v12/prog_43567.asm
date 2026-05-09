; DESCRIPTION: Renders a cyan box of size 56x30 starting at (184, 223).
; PLAN: r0=184(x), r1=223(y), r2=56(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 223
LDI r2, 56
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
