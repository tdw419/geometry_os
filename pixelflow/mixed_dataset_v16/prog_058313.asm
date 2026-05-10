; DESCRIPTION: Places a blue 98x42 rectangle at position (217, 210).
; PLAN: r0=217(x), r1=210(y), r2=98(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 210
LDI r2, 98
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
