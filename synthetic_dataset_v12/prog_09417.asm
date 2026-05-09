; DESCRIPTION: Places a cyan 50x113 rectangle at position (295, 73).
; PLAN: r0=295(x), r1=73(y), r2=50(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 73
LDI r2, 50
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
