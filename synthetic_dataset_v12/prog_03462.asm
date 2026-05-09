; DESCRIPTION: Renders a cyan box of size 26x52 starting at (429, 30).
; PLAN: r0=429(x), r1=30(y), r2=26(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 30
LDI r2, 26
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
