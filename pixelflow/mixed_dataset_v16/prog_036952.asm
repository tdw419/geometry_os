; DESCRIPTION: Renders a cyan box of size 21x120 starting at (211, 12).
; PLAN: r0=211(x), r1=12(y), r2=21(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 12
LDI r2, 21
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
