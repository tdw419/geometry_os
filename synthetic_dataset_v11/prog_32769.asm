; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (97, 135) to (209, 142). Then Draws a white rectangle at (146, 33) with width 34 and height 45.
; PLAN: r0=97(x1), r1=135(y1), r2=209(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=33(y), r2=34(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (97, 135) to (209, 142).
; PLAN: r0=97(x1), r1=135(y1), r2=209(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 135
LDI r2, 209
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (146, 33) with width 34 and height 45.
; PLAN: r0=146(x), r1=33(y), r2=34(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 33
LDI r2, 34
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
