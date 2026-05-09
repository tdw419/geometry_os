; DESCRIPTION: Composite: . Then Places a yellow dot at position (36, 8). Then Renders a black box of size 38x42 starting at (123, 142).
; PLAN: r0=36(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=123(x), r1=142(y), r2=38(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (36, 8).
; PLAN: r0=36(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 38x42 starting at (123, 142).
; PLAN: r0=123(x), r1=142(y), r2=38(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 142
LDI r2, 38
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
