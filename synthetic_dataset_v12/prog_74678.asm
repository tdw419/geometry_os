; DESCRIPTION: Renders a green box of size 82x113 starting at (126, 5).
; PLAN: r0=126(x), r1=5(y), r2=82(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 5
LDI r2, 82
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
