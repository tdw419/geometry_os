; DESCRIPTION: Places a red 103x20 rectangle at position (363, 225).
; PLAN: r0=363(x), r1=225(y), r2=103(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 225
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
