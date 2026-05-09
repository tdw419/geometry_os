; DESCRIPTION: Places a yellow 21x21 rectangle at position (482, 215).
; PLAN: r0=482(x), r1=215(y), r2=21(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 215
LDI r2, 21
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
