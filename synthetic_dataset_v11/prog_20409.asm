; DESCRIPTION: Places a blue 45x21 rectangle at position (171, 228).
; PLAN: r0=171(x), r1=228(y), r2=45(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 228
LDI r2, 45
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
