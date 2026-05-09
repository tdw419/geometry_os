; DESCRIPTION: Renders a yellow box of size 16x25 starting at (488, 146).
; PLAN: r0=488(x), r1=146(y), r2=16(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 146
LDI r2, 16
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
