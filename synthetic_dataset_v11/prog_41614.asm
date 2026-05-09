; DESCRIPTION: Places a cyan 113x65 rectangle at position (7, 182).
; PLAN: r0=7(x), r1=182(y), r2=113(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 182
LDI r2, 113
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
