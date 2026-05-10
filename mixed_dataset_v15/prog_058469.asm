; DESCRIPTION: Renders a red box of size 60x63 starting at (284, 95).
; PLAN: r0=284(x), r1=95(y), r2=60(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 95
LDI r2, 60
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
