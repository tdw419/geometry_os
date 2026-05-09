; DESCRIPTION: Composite: . Then Places a purple 120x15 rectangle at position (45, 121). Then Places a magenta dot at position (204, 210).
; PLAN: r0=45(x), r1=121(y), r2=120(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=204(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 120x15 rectangle at position (45, 121).
; PLAN: r0=45(x), r1=121(y), r2=120(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 121
LDI r2, 120
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (204, 210).
; PLAN: r0=204(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
