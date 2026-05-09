; DESCRIPTION: Places a cyan 98x55 rectangle at position (150, 173).
; PLAN: r0=150(x), r1=173(y), r2=98(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 173
LDI r2, 98
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
