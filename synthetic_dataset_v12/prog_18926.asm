; DESCRIPTION: Places a blue 93x27 rectangle at position (290, 180).
; PLAN: r0=290(x), r1=180(y), r2=93(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 180
LDI r2, 93
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
