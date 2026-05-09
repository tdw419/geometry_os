; DESCRIPTION: Places a cyan 120x46 rectangle at position (149, 202).
; PLAN: r0=149(x), r1=202(y), r2=120(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 202
LDI r2, 120
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
