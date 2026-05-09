; DESCRIPTION: Composite: . Then Places a green dot at position (219, 149). Then Renders a yellow box of size 29x90 starting at (32, 121).
; PLAN: r0=219(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=32(x), r1=121(y), r2=29(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (219, 149).
; PLAN: r0=219(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 29x90 starting at (32, 121).
; PLAN: r0=32(x), r1=121(y), r2=29(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 121
LDI r2, 29
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
