; DESCRIPTION: Renders a green box of size 47x120 starting at (173, 50).
; PLAN: r0=173(x), r1=50(y), r2=47(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 50
LDI r2, 47
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
