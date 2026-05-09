; DESCRIPTION: Renders a cyan box of size 70x120 starting at (402, 8).
; PLAN: r0=402(x), r1=8(y), r2=70(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 8
LDI r2, 70
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
