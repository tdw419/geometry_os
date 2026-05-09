; DESCRIPTION: Renders a yellow box of size 82x30 starting at (95, 214).
; PLAN: r0=95(x), r1=214(y), r2=82(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 214
LDI r2, 82
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
