; DESCRIPTION: Places a cyan 33x98 rectangle at position (380, 50).
; PLAN: r0=380(x), r1=50(y), r2=33(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 50
LDI r2, 33
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
