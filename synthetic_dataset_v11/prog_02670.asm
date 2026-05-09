; DESCRIPTION: Composite: . Then Places a cyan dot at position (103, 152). Then Draws a cyan rectangle at (121, 63) with width 116 and height 109.
; PLAN: r0=103(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=63(y), r2=116(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (103, 152).
; PLAN: r0=103(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (121, 63) with width 116 and height 109.
; PLAN: r0=121(x), r1=63(y), r2=116(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 63
LDI r2, 116
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
