; DESCRIPTION : F il ls the en ti re 256 x 256 screen with s o l id blue color ( 0x 00 00FF ) . It the n draws a circle centered at ( 10 , 10 ) us ing color 0x 80 5 and color 0x 80 C E . The circle is drawn with center co or d in ate s ( 10 , 10 ) with a radius of 0x 80 7 . The circle is drawn at ( 25 4 9 C 1 , 16 ) with color 0x 8 E 9 6 A C 2 .

; si mp le draw pro g ra m
; initi ali z ation
LDI r0, 32
LDI r12, 0xF00F00
LDI r0, 255
LDI r13, 0x5C8F95
LDI r6, 0x0A0F00
LDI r7, 0x3F0444
LDI r9, 4
CIRCLE r2, r0, r7, r9
LDI r7, 10
LDI r10, 2
LDI r14, 0xCE3CFB
LDI r1, 0x3D4856
CIRCLE r7, r10, r14, r1
HALT