; DESCRIPTION: Renders a cyan box of size 113x50 starting at (109, 206).
; PLAN: r0=109(x), r1=206(y), r2=113(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 206
LDI r2, 113
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
