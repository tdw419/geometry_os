; DESCRIPTION: Places a cyan 92x58 rectangle at position (290, 14).
; PLAN: r0=290(x), r1=14(y), r2=92(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 14
LDI r2, 92
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
