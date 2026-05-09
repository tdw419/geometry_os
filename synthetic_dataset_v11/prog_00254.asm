; DESCRIPTION: Composite: . Then Places a yellow dot at position (110, 102). Then Renders a yellow box of size 73x109 starting at (95, 42).
; PLAN: r0=110(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=95(x), r1=42(y), r2=73(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (110, 102).
; PLAN: r0=110(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 73x109 starting at (95, 42).
; PLAN: r0=95(x), r1=42(y), r2=73(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 42
LDI r2, 73
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
