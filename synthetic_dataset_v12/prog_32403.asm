; DESCRIPTION: Creates a cyan rectangular region at (277, 208) spanning 80 by 21 pixels.
; PLAN: r0=277(x), r1=208(y), r2=80(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 208
LDI r2, 80
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
