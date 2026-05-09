; DESCRIPTION: Composite: . Then Renders a red box of size 42x17 starting at (63, 236). Then Places a purple dot at position (208, 138).
; PLAN: r0=63(x), r1=236(y), r2=42(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=208(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 42x17 starting at (63, 236).
; PLAN: r0=63(x), r1=236(y), r2=42(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 236
LDI r2, 42
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (208, 138).
; PLAN: r0=208(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
