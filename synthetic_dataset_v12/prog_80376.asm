; DESCRIPTION: Places a green 92x45 rectangle at position (248, 150).
; PLAN: r0=248(x), r1=150(y), r2=92(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 150
LDI r2, 92
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
