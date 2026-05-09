; DESCRIPTION: Renders a yellow box of size 82x16 starting at (70, 178).
; PLAN: r0=70(x), r1=178(y), r2=82(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 178
LDI r2, 82
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
