; DESCRIPTION: Places a cyan 48x109 rectangle at position (230, 7).
; PLAN: r0=230(x), r1=7(y), r2=48(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 7
LDI r2, 48
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
