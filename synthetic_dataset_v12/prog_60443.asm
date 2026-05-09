; DESCRIPTION: Renders a yellow box of size 82x73 starting at (197, 125).
; PLAN: r0=197(x), r1=125(y), r2=82(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 125
LDI r2, 82
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
