; DESCRIPTION: Places a cyan 67x92 rectangle at position (180, 142).
; PLAN: r0=180(x), r1=142(y), r2=67(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 142
LDI r2, 67
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
